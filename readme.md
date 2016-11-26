# Azure Python Site Extensions

This repository contains the build scripts for the [Python site extensions](https://www.siteextensions.net/packages?q=python) for Azure App Service.

# Installing and Using

To install a Site Extension into an Azure App service instance, you can use the portal at [portal.azure.com](https://portal.azure.com). Go to the Web App and search for Extensions.

To deploy as part of an ARM template, include a site extension resource in your site. For example, the below resource will install Python 3.5.1 x64 as part of deploying your site.

```json
{
  "resources": [
    {
      "apiVersion": "2015-08-01",
      "name": "[parameters('siteName')]",
      "type": "Microsoft.Web/sites",
      ...
      "resources": [
        {
          "apiVersion": "2015-08-01",
          "name": "python352x64",
          "type": "siteextensions",
          "properties": { },
          "dependsOn": [
            "[resourceId('Microsoft.Web/sites', parameters('siteName'))]"
          ]
        },
      ...
```

Once the site extension has been installed, you need to activate Python through your `web.config` file using either the FastCGI module or the HttpPlatform module.

## Using FastCGI

The [wfastcgi](https://pypi.io/project/wfastcgi) package is preinstalled and configured as part of the extension. This module uses the IIS FastCGI module to communicate with a persistent Python process that has provided a WSGI-compatible web server.

Your `web.config` configuration should include the following:

```xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <appSettings>
    <add key="PYTHONPATH" value="D:\home\site\wwwroot"/>
    <add key="WSGI_HANDLER" value="app.wsgi_app"/>
    <add key="WSGI_LOG" value="D:\home\LogFiles\wfastcgi.log"/>
  </appSettings>
  <system.webServer>
    <handlers>
      <add name="PythonHandler" path="*" verb="*" modules="FastCgiModule" scriptProcessor="D:\home\Python35\python.exe|D:\home\Python35\wfastcgi.py" resourceType="Unspecified" requireAccess="Script"/>
    </handlers>
  </system.webServer>
</configuration>
```

The value for `PYTHONPATH` may be freely extended, but must include the root of your website. `WSGI_HANDLER` should be updated to point to a WSGI app importable from your website. `WSGI_LOG` is optional but recommended while debugging your site. All app settings are made available to the app as environment variables.

The path to `python.exe` may need to be customized depending on the version of Python you are using. See the description of the site extension to find out where it will be installed and update these paths accordingly.

## Using HttpPlatform

The [HttpPlatform](http://www.iis.net/learn/extensions/httpplatformhandler/httpplatformhandler-configuration-reference) module forwards socket connections directly to a standalone Python process, so you will require a startup script that runs a local web server.

```xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <system.webServer>
    <handlers>
      <add name="PythonHandler" path="*" verb="*" modules="httpPlatformHandler" resourceType="Unspecified"/>
    </handlers>
    <httpPlatform processPath="D:\home\Python35\python.exe"
                  arguments="D:\home\site\wwwroot\runserver.py --port %HTTP_PLATFORM_PORT%"
                  stdoutLogEnabled="true"
                  stdoutLogFile="D:\home\LogFiles\python.log"
                  startupTimeLimit="60"
                  processesPerApplication="16">
      <environmentVariables>
        <environmentVariable name="SERVER_PORT" value="%HTTP_PLATFORM_PORT%" />
      </environmentVariables>
    </httpPlatform>
  </system.webServer>
</configuration>
```

The path to `python.exe` may need to be customized depending on the version of Python you are using. See the description of the site extension to find out where it will be installed and update these paths accordingly.

Arguments may be freely customized for your app. The `HTTP_PLATFORM_PORT` environment variable contains the port your local server should listen on for connections from `localhost`.

In this example, another environment variable `SERVER_PORT` is created, but this is not required. Environment variables may be added or removed as necessary for your app.

## Static Files

For static directories, we recommend using another `web.config` to remove the Python handler and allow the default static file handler to take over. Such a `static/web.config` may look like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <system.webServer>
    <handlers>
      <remove name="PythonHandler" />
    </handlers>
  </system.webServer>
</configuration>
```


# Contributing

Contributions are welcomed to this repository. Updates to official site extensions are managed by Microsoft employees. If you do intend to publish your own extensions built from these scripts, please modify the `nuspec` files to avoid confusion.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/). For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Building the extensions

To build all extensions, run `build_all.cmd`.

To build one extension, use `build.cmd [source exe] [target name] [package name]`, where `source exe` is a command to execute the version of Python to use, `target name` is the last directory segment where it will be installed in App Service, and `package name` is the name of the subdirectory with the `.nuspec` file and other content.

For example:

```
build.bat "py -3.5" Python35 352x64
build.bat C:\Python27\python.exe Python27 2712x86
```

Note that the referenced install of Python must match the intended target version. No validation is performed to ensure this.

# License
Licensed as MIT - please see LICENSE for details.
