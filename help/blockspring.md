---- Blockspring API Engine Development Guide ---
=================================================

Installation
------------

### Installation on Google Sheet
  - [TODO] Vérifier que ce How-to est complet

  1. Open any Google Sheet from Google Drive or create a new one
  2. In the SpreadSheet, click on 'Add-ons > get add-ons...'
  3. In the 'search add-ons' input field, enter `blockspring`
  4. On the 'Blockspring for Google Sheet' add-on, click on the '+FREE' Button
  5. Authorize Blockspring


Access Google SpreadSheet through Blockspring
------------------------------------------------

### 1. Create Google SpeadSheet

  + Create a Spread Sheet in Google Drive and populate data in a WorkSheet
  + Click on 'File > Share...'
  + Select access right: 'Any one with the link can edit' 
  + copy the sharable link: it should be something like `https://docs.google.com/spreadsheets/d/1AgVeZm4Dw4AB_BgoJx9zTzetZ_8uNxLbTFX9ta8adRQ/edit?usp=sharing`

### 2. API access test from BlockSpring
  + open [Blockspring Query Google SpreadSeet page](https://open.blockspring.com/donpinkus/query-google-spreadsheet)
  + in the 'Data Explorer' section at the bottom of the page, enter:
    - 'URL': the url of the spreadsheet copied in #4
    - 'Query': the Google SQL-like query
      - should be of the form : ` SELECT A, B, C, E, F WHERE C >= 2000 AND D CONTAINS 'Paris' `
      - [official google query doc](https://developers.google.com/chart/interactive/docs/querylanguage#setting-the-query-from-javascript)
    - click on the 'Run' button
    - check that the spreadsheet data is correctly displayed

### 3. API access test from local machine
#### Retrieve blockstring API Key 
  + on the  'Access Google Sheets section of the '[Blockspring Query Google SpreadSeet page](https://open.blockspring.com/donpinkus/query-google-spreadsheet):
    - click on the 'change tool' link (Step 1: Choose your tool)
    - in the application list, select 'Code '
    - click on the 'Webhook' tab
    - copy copy the api key
      
    
#### Creation of a local project 
  $ mkcd <path/to/project/dirname> 
  $ npm init -y   # initialize npm directory with default configurations values.
  $ npm install -S blockspring  # install blockspring module as a dependancy of our project
  $ in index.js paste the following boilerplate:

    ```
    queryParams = {
      # example url : 'https://docs.google.com/spreadsheets/d/1AgVeZm4Dw4AB_BgoJx9zTzetZ_8uNxLbTFX9ta8adRQ/edit?usp=sharing',
      url: <google sheet share link here...>,
      # example query : "SELECT A, B, C, E, F WHERE C >= 2000 AND D CONTAINS 'Paris'"
      query: <SQL-like query here...>
    };

    queryApiKey = {
      # example api key : 'br_22266_a42edfb9a6fd81943d555d190026893d87542bb8'
      api_key: <api key here...>
    };

    blockspring.runParsed('query-public-google-spreadsheet', queryParams, queryApiKey, function(res) {
      return console.log(JSON.stringify(res.params));
    });                                                
    ```
#### Test the request: 
  $ node index.js | jq .
  # check correct data is returned in JSON format


