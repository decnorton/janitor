FROM node:10
MAINTAINER Thai Pangsakulyanont

LABEL "com.github.actions.name"="Janitor"
LABEL "com.github.actions.description"="Pushes changes back to GitHub"
LABEL "com.github.actions.icon"="git-commit"
LABEL "com.github.actions.color"="blue"

ENV GIT_AUTHOR_NAME=Janitor
ENV GIT_AUTHOR_EMAIL=ghost@users.noreply.github.com

COPY package.json package-lock.json /usr/src/app/
RUN ["npm", "ci"]
COPY . /usr/src/app/

ENTRYPOINT ["node", "/usr/src/app/main.js"]
