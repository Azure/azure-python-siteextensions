import pip
import os.path
import sys
from pyfindvs.msbuildcompiler import MSBuildCompiler

compiler = MSBuildCompiler()
compiler.initialize()

compiler.set_include_dirs([os.path.join(sys.prefix, 'Include')])
compiler.set_library_dirs([os.path.join(sys.prefix, 'libs')])

ver_number = ', '.join(((pip.__version__ + '.0.0.0.0').split('.'))[:4])
compiler.define_macro('PIP_VERSION', '\\"{0}\\"'.format(pip.__version__))
compiler.define_macro('PIP_VERSION_NUMBER', ver_number)

out_dir, out_name = os.path.split(os.path.abspath(sys.argv[1]))
compiler.options.PlatformToolset = "v141"
compiler.options.IntDir = os.path.abspath(sys.argv[2]) + '\\'
compiler.options.GenerateManifest = False

SOURCES = [os.path.join(os.path.dirname(__file__), f) for f in [
    'pip.cpp',
    'pip.rc'
]]

objs = compiler.compile(SOURCES)
compiler.link('executable', objs, out_name, out_dir)
