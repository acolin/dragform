# DragForm Plugin

A plugin for creating forms using dead simple Drag&Drop

### Usage

```
<div id='dragform'></div>
<!-- external dependencies -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.2/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/knockout/2.2.1/knockout-min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/knockout.mapping/2.4.1/knockout.mapping.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/knockout-sortable/0.9.3/knockout-sortable.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/knockout-validation/2.0.3/knockout.validation.min.js'></script>
<!-- end -->

<script src="path/to/dragform.min.js"></script>
<script>
  $(function(){
    new DragForm();
  });
</script>
```

### Development

```
git clone
cd /path/to/repo
npm install

// Run the dev server at localhost:8080
webpack-dev-server
```

### Authors
* [acolin](https://github.com/acolin)
* [jesuslerma](https://github.com/jesuslerma)
