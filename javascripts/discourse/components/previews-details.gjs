import ItemTopicCell from "discourse/components/topic-list/item/topic-cell";
import PreviewsExcerpt from "./details/previews-excerpt";
import PreviewsFooter from "./details/previews-footer";

<template>
  <div>top</div>
  <div class="topic-details">
    <ItemTopicCell @topic={{@topic}} />
    <div>Test1</div>
    <PreviewsExcerpt @topic={{@topic}} />
    <div>Test2</div>
    <PreviewsFooter @topic={{@topic}} />
    <div>Test3</div>
  </div>
</template>
