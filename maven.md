# Setup Project

Setup a project from a Project Archetype. 

Check the Adobe docs for the latest versions.

## Sites

````shell
mvn -B archetype:generate -D archetypeGroupId=com.adobe.aem -D archetypeArtifactId=aem-project-archetype -D archetypeVersion=37 -D aemVersion=6.5.0 -D appTitle="My Site" -D appId="mysite" -D groupId="com.mysite" -D frontendModule=general -D includeExamples=n
````

:warning: Adapt the typescript version to `^4.8.2` or the ui.frontend package will not build.

# Build Project 

````shell
mvn clean install -PautoInstallPackage -Padobe-public
````