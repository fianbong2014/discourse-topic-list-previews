import Component from "@glimmer/component";

export default class PreviewsCategories extends Component {
    get categories() {
        const topic = this.args.topic;

        console.log("ค่าที่ได้รับใน topic:", topic);

        if (!topic || !topic.category_id || !topic.category_name) {
            return "ไม่ระบุหมวดหมู่";
        }

        console.log("ชื่อหมวดหมู่:", topic.category_name);

        return topic.category_name;
    }
    
    <template>
        <div class="categories">
          🗂️ หมวดหมู่: {{this.categories}}
        </div>
    </template>
}
