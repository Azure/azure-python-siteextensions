# Azure Python Site Extensions

This repository contains the build scripts for the [Python site extensions](https://www.siteextensions.net/packages?q=python) for Azure App Service.

All scripts are available under the terms of the 

## Building the extensions

To build all extensions, run `build_all.cmd`.

To build one extension, use `build.cmd [source exe] [target name] [package name]`, where `source exe` is a command to execute the version of Python to use, `target name` is the last directory segment where it will be installed in App Service, and `package name` is the name of the subdirectory with the `.nuspec` file and other content.

For example:

```
build.bat "py -3.5" Python35 351x64
build.bat C:\Python27\python.exe Python27 2711x86
```

Note that the referenced install of Python must match the intended target version. No validation is performed to ensure this.

## Contributing

Contributions are welcomed to this repository. Updates to official site extensions are managed by Microsoft employees. If you do intend to publish your own extensions built from these scripts, please modify the `nuspec` files to avoid confusion.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/). For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## License
Licensed as MIT - please see LICENSE for details.
