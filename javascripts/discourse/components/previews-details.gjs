import ItemTopicCell from "discourse/components/topic-list/item/topic-cell";
import PreviewsExcerpt from "./details/previews-excerpt";
import PreviewsFooter from "./details/previews-footer";
import PreviewsTitle  from "./details/previews-title";

<template>
  <div class="topic-details" style="padding-top: 0.75rem;">
    <PreviewsTitle @topic="{{@topic}}">
    <PreviewsExcerpt @topic={{@topic}} />
    <PreviewsFooter @topic={{@topic}} />
  </div>
</template>
