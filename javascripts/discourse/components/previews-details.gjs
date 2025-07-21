import ItemTopicCell from "discourse/components/topic-list/item/topic-cell";
import PreviewsExcerpt from "./details/previews-excerpt";
import PreviewsFooter from "./details/previews-footer";
import PreviewsCategories from "./details/previews-categories"; 

<template>
  <div class="topic-details" style="padding-top: 0.75rem;">
    <PreviewsCategories @topic={{@topic}} />
    <PreviewsExcerpt @topic={{@topic}} />
    <PreviewsFooter @topic={{@topic}} />
  </div>
</template>
