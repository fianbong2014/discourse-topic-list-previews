import PreviewsActions from "./footer/previews-actions";
import PreviewsMeta from "./footer/previews-meta";
import PreviewsUsers from "./footer/previews-users";
import PreviewsBadges from "./footer/previews-badges";

<template>
   {{!-- <div class="topic-footer-badge">
    <PreviewsBadges @topic={{@topic}} /> 
  </div>  --}}
  <div class="topic-footer">
    <PreviewsMeta @topic={{@topic}} />
    <PreviewsUsers @topic={{@topic}} />
    <PreviewsActions @topic={{@topic}} />
  </div>
</template>
