#!/bin/bash

DOCS_FILE=./web/controllers/README.md
DOCS_FILE_HTML=./web/controllers/api_docs.html

showdown makehtml -i $DOCS_FILE -o $DOCS_FILE_HTML

curl -T $DOCS_FILE_HTML ftp://$DOCS_DEPLOY_FTP_HOST/$DOCS_DEPLOY_FTP_PATH --user $DOCS_DEPLOY_FTP_USER:$DOCS_DEPLOY_FTP_PASS

if $CI; then
  rm -rf $DOCS_FILE
  rm -rf $DOCS_FILE_HTML
fi

exit 0
