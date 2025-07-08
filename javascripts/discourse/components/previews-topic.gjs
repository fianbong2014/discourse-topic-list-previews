import ItemTopicCell from "discourse/components/topic-list/item/topic-cell";

<template>
  <div class="topic">
    <!--ItemTopicCell @topic={{@topic}} /-->

    
    {{~! no whitespace ~}}
    <PluginOutlet @name="topic-link" @outletArgs={{lazyHash topic=@topic}}>
      {{~! no whitespace ~}}
      <a
        href={{this.url}}
        data-topic-id={{@topic.id}}
        class="title"
        ...attributes
      >{{htmlSafe @topic.fancyTitle}}</a>
      {{~! no whitespace ~}}
    </PluginOutlet>
    {{~! no whitespace ~}}
  
  </div>
  <div>-------</div>
</template>
