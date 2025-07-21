import Component from "@glimmer/component";

export default class PreviewsCategories extends Component {
    get categories() {
        const topic = this.args.topic;

        console.log("ค่าที่ได้รับใน topic:", topic);
        console.log('topic.tags: ', topic.tags)
        if (!topic || !topic.category_id || !topic.category_name || topic.tags) {
            return "ไม่ระบุหมวดหมู่";
        }

        console.log("ชื่อหมวดหมู่:", topic.tags);

        return topic.tags;
    }
    
    <template>
        <div class="categories">
          🗂️ categories:
          {{#each this.categories as |category|}}
            <span class="adge-categories">{{category}}</span>
          {{/each}}
        </div>
    </template>
}
