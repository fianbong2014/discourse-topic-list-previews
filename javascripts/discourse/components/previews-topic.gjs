import ItemTopicCell from "discourse/components/topic-list/item/topic-cell";


<template>
  <div class="topic">
    <!--ItemTopicCell @topic={{@topic.fancyTitle}} /-->
    <a
        href=''
        data-topic-id={{@topic.id}}
        class="title"
    
      >{{htmlSafe @topic.fancyTitle}}</a>
  
  </div>
  <div>-------</div>
</template>
