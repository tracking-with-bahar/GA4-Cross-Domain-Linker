___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "GA4 Cross-Domain Linker",
  "description": "Validates allowed domains for GA4 cross-domain tracking and determines whether incoming cross-domain parameters should be accepted.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "GROUP",
    "name": "group1",
    "displayName": "",
    "groupStyle": "NO_ZIPPY",
    "subParams": []
  },
  {
    "type": "SIMPLE_TABLE",
    "name": "simpleTable",
    "displayName": "Configure Domains",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Domain",
        "name": "domain",
        "type": "TEXT",
        "valueHint": "example.com",
        "isUnique": true
      }
    ],
    "newRowButtonText": "Add Domain",
    "help": "Supply your domain list of domains across which your _ga information should be shared."
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

let makeString = require('makeString');
let logToConsole = require('logToConsole');
let getUrl = require('getUrl');
const queryPermission = require('queryPermission');

let domains = [];
let domainMatched = false;

if (!queryPermission('get_url', 'host')) {
    return {
        domains: [],
        accept_incoming: false
    };
}

let currentDomain = makeString(getUrl('host')).toLowerCase();

data.simpleTable.forEach((domain) => {
    let inputDomain = makeString(domain.domain).toLowerCase();

    domains.push(inputDomain);

    if (inputDomain === currentDomain) {
        domainMatched = true;
    }
});

if (!domainMatched) return;

return {
    domains: domains,
    accept_incoming: domainMatched
};


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "get_url",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urlParts",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "queriesAllowed",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 11/18/2026, 1:39:00 PM


