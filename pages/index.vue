<template>
  <a-layout style="background: #fff; padding:20px 0">
    <a-space direction="vertical" align="center">
      <a-table bordered :columns="columns" :data-source="list">
          <a-button slot="action" type="primary" slot-scope="text, record" @click="showModal(record)"> <a-icon type="edit" />  Edit</a-button>
      </a-table>
    </a-space>
    <a-modal v-model="visible" title="Edit rule" @ok="handleOk">
      <a-form-model v-bind="layout" :model="form">
        <a-form-model-item label="Compare from">
          <a-date-picker :format="dateFormat" :valueFormat="dateFormat" v-model="form.compare_from" />
        </a-form-model-item>
        <a-form-model-item label="Compare until">
          <a-date-picker :format="dateFormat" :valueFormat="dateFormat" v-model="form.compare_until" />
        </a-form-model-item>
        <a-form-model-item label="Description">
          <a-textarea v-model="form.description" :auto-size="{ minRows: 2, maxRows: 6 }" />
        </a-form-model-item>
        <a-form-model-item label="From date">
          <a-date-picker :format="dateFormat" :valueFormat="dateFormat" v-model="form.from_date" />
        </a-form-model-item>
        <a-form-model-item :wrapper-col="{ span: 14, offset: 4 }">
        <a-button type="primary" @click="onSubmit">
          Execute
        </a-button>
        </a-form-model-item>
      </a-form-model>
    </a-modal>
  </a-layout>
</template>

<script>
export default {
  components: {},
  data() {
    return {
      visible: false,
      form: {},
      layout: {
        labelCol: { span: 8 },
        wrapperCol: { span: 14 },
      },
      dateFormat: 'YYYY-MM-DD',
      columns: [
         {
          title: '#',
          dataIndex: 'alarm_index',
          key: 'alarm_index',
        },
        {
          title: 'Compare from',
          dataIndex: 'compare_from',
          key: 'compare_from',
        },
        {
          title: 'Compare until',
          dataIndex: 'compare_until',
          key: 'compare_until',
        },
        {
          title: 'Description',
          dataIndex: 'description',
          key: 'description',
        },
        {
          title: 'From date',
          dataIndex: 'from_date',
          key: 'from_date',
        },
        {
          title: 'Insert only',
          dataIndex: 'insert_only',
          key: 'insert_only',
        },
        {
          title: 'Is Active',
          dataIndex: 'is_active',
          key: 'is_active',
        },
        { title: 'Action', dataIndex: '', key: '', scopedSlots: { customRender: 'action' } },
      ]
    }
  },
  async asyncData({ params, $http }) {
    const res = await $http.get('/api/rules');
    const { list } = await res.json();
    return { list };
  },
  methods: {
    showModal(record) {
      this.form = record;
      this.visible = true;
    },
    handleOk(e) {
      this.visible = false;
    },
    onSubmit() {
      this.$http.$post('/api/rule', this.form);
      this.visible = false;
    }
  },
}
</script>
