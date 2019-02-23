https://trailhead.salesforce.com/content/learn/projects/develop-app-with-salesforce-cli-and-source-control/create-salesforce-dx-project
sfdx force:project:create --projectname sfdx-chan
scratch  json

{
  "orgName": "DreamHouse Realty",
  "edition": "Developer",
  "settings": {
    "orgPreferenceSettings": {
      "s1EncryptedStoragePref2": false
    }
  }
}

assets/ package.xml

sfdx force:source:retrieve --manifest assets/package.xml --targetusername DevHub --wait 10

sfdx force:data:tree:export --targetusername DevHub --outputdir assets/data --query "SELECT Id, Name, Email__c, Phone__c, Mobile_Phone__c, Title__c, Picture__c, ( SELECT Id, Address__c, Assessed_Value__c, Baths__c, Beds__c, Broker__c, City__c, Date_Agreement__c, Date_Closed__c, Date_Contracted__c, Date_Listed__c, Date_Pre_Market__c, Description__c, Location__Longitude__s, Location__Latitude__s, Picture__c, Price__c, Name, State__c, Status__c, Tags__c, Thumbnail__c, Title__c, Zip__c FROM Properties__r ) FROM Broker__c"


git init
git add .
git commit -m "first commit"
git remote add origin git@github.com:pengtang82/sfdx-project.git
git push -u origin master

https://trailhead.salesforce.com/content/learn/projects/develop-app-with-salesforce-cli-and-source-control/add-salesforce-dx-project-to-source-control

create scratch org
sfdx force:org:create --setdefaultusername --setalias sfdx-chan --definitionfile config/project-scratch-def.json


sfdx force:source:pull