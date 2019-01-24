FROM node:10-onbuild
MAINTAINER Thai Pangsakulyanont

LABEL "com.github.actions.name"="Janitor"
LABEL "com.github.actions.description"="Pushes changes back to GitHub"
LABEL "com.github.actions.icon"="git-commit"
LABEL "com.github.actions.color"="blue"

ENTRYPOINT ["node", "/usr/src/app/main.js"]
