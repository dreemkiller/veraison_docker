# Overview
This is a build environment using Docker for the Veraison project (https://github.com/veraison/veraison).

# Instructions
This is intended to be used in VS code via remote docker access.

To use, follow the instructions here: 
```
https://levelup.gitconnected.com/a-complete-go-development-environment-with-docker-and-vs-code-2355aafe2a96
```

Primarily, in the target project's root directory, you need a file called `.devcontainer.json`, that contains the following:
```
{
   "dockerFile": <PATH TO THE DOCKERFILE IN THIS PROJECT>,
   "extensions": [ 
      "ms-vscode.go" 
   ]
}
```

When you open the project with VS Code, it will prompt to you reopen it to develop in a container. Do that.
