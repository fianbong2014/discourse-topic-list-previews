import ItemTopicCell from "discourse/components/topic-list/item/topic-cell";

export default class topic extends Component {
 get url() {
    return this.args.topic.linked_post_number
      ? this.args.topic.urlForPostNumber(this.args.topic.linked_post_number)
      : this.args.topic.lastUnreadUrl;
  }
}
<template>
  <div class="topic">
    <!--ItemTopicCell @topic={{@topic.fancyTitle}} /-->
    <a
        href={{this.url}}
        data-topic-id={{@topic.id}}
        class="title"
        ...attributes
      >{{htmlSafe @topic.fancyTitle}}</a>
  
  </div>
  <div>-------</div>
</template>
