# ð **Day98_230105**

# 1. Mongo DB

### í°ë¯¸ëì ì´ì©í´ npm ì¤ì 

```bash
npm i nodemon
npm i mongodb
npm i express
```

### server.jsì½ë

```jsx
const express = require('express')
const app = express();

const MongoClient = require('mongodb').MongoClient;
MongoClient.connect('mongodb+srv://<id>:<password>@cluster0.jq7efgh.mongodb.net/?retryWrites=true&w=majority',
    (err, client)=>{
    
    app.listen(7000, ()=>{
        console.log('listening 7000'); //í¬í¸ë²í¸ 7000ì íµí´ cors í´ê²°
    })

    app.get('/', (req, resp)=>{
        resp.sendFile(__dirname + '/index.html')
    })

})
```

ì´í index.htmlì ë§ë í [localhost:7000](http://localhost:7000) ì ë¤ì´ê°ì§ë©´ ìë£!