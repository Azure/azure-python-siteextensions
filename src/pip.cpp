#include <windows.h>

typedef int (*Py_MainW)(int argc, const wchar_t **argv);
typedef int (*Py_MainA)(int argc, char **argv);

int wc_to_mb(char** dest, const wchar_t *src) {
    BOOL usedDefault = FALSE;
    DWORD len = WideCharToMultiByte(CP_ACP, 0, src, -1, NULL, 0, NULL, &usedDefault);
    if (usedDefault) {
        SetLastError(ERROR_NO_UNICODE_TRANSLATION);
        return 0;
    }
    *dest = new char[len];
    return WideCharToMultiByte(CP_ACP, 0, src, -1, *dest, len, NULL, NULL);
}

void free_argvA(int argc, char **argv) {
    for (int i = 0; i < argc; ++i) {
        delete argv[i];
    }
    delete[] argv;
}

int
wmain(int argc, wchar_t **argv)
{
    const wchar_t **new_argv = new const wchar_t*[argc + 2];
    new_argv[0] = argv[0];
    new_argv[1] = L"-m";
    new_argv[2] = L"pip";
    for (int i = 1; i < argc; ++i) {
        new_argv[i + 2] = argv[i];
    }

    HMODULE python = NULL;
    int res = HRESULT_FROM_WIN32(ERROR_FILE_NOT_FOUND);

    if ((python = LoadLibraryW(L"python37")) ||
        (python = LoadLibraryW(L"python36")) ||
        (python = LoadLibraryW(L"python35"))) {
        Py_MainW pymain = (Py_MainW)GetProcAddress(python, "Py_Main");
        if (pymain) {
            res = pymain(argc + 2, new_argv);
        }
    } else if ((python = LoadLibraryW(L"python27"))) {
        Py_MainA pymain = (Py_MainA)GetProcAddress(python, "Py_Main");
        if (pymain) {
            char **new_argvA = new char*[argc + 2];
            for (int i = 0; i < argc + 2; ++i) {
                new_argvA[i] = NULL;
            }
            for (int i = 0; i < argc + 2; ++i) {
                if (!wc_to_mb(&new_argvA[i], new_argv[i])) {
                    res = HRESULT_FROM_WIN32(GetLastError());
                    pymain = NULL;
                    break;
                }
            }
            if (pymain) {
                res = pymain(argc + 2, new_argvA);
            }
            free_argvA(argc + 2, new_argvA);
        }
    }

    if (python) {
        FreeLibrary(python);
    }

    delete[] new_argv;

    return res;
}
