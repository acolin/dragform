# DragForm Plugin

A plugin for creating forms using dead simple Drag&Drop

### Usage

```javascript
<div id='dragform'></div>

<script src="path/to/dragform.min.js"></script>
<script>
  new DragForm();
</script>
```

### DragForm params

```javascript
new DragForm({
        "id": 1,
        "fields": [
          {
            "id": 34,
            "helpText":"da help text",
            "position":1,
            "required":false,
            "options":[],
            "title":"Pregunta parrafo?",
            "type":"textarea",
          },
          {
            "id": 35,
            "helpText":"helpz",
            "position":3,
            "required":false,
            "options":[
              {
                "value":"One"
              },
              {
                "value":"Two"
              }
            ],
            "title":"Pregunta texto?",
            "type":"select"
          },
          {
            "id": 124,
            "helpText": null,
            "position": 4,
            "required": true,
            "options":[],
            "title":"¿Cuál es tu nombre?",
            "type":"text",
          }
        ]
  });
```

## Subscribe to triggers/events
```javascript
var dragForm = new DragForm();

// onChanges: is triggered after adding, removing or changing position or content of a question.
dragForm('onChanges', function(form) {
  // the resulting json is the same as above params
  var json = form.toJSON();
});
// onPublish: is triggered after pressing the publish button
dragForm('onPublish', function(form) {
  // the resulting json is the same as above params
  var json = form.toJSON();
});
```

### Development

```
git clone git@github.com:acolin/dragform.git
cd /path/to/repo
npm install

// Run the dev server at localhost:8080
webpack-dev-server
```

### Running tests

```
npm test
```

### Authors
* [acolin](https://github.com/acolin)
* [jesuslerma](https://github.com/jesuslerma)
