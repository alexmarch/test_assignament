<template>
  <div>
    <a-layout style="background: #fff; padding:20px 0">
      <a-space direction="vertical" align="center">
        <a-table bordered :columns="columns" :data-source="list">
        </a-table>
      </a-space>
   </a-layout>
  </div>
</template>

<script>
export default {
    data() {
      return {
        columns: [
          {
            title: '#',
            dataIndex: 'alarm_index',
            key: 'alarm_index_soft_alarm',
          },
          {
            title: 'Address',
            dataIndex: 'address',
            key: 'address',
          },
          {
            title: 'Alarm index',
            dataIndex: 'alarm_index',
            key: 'alarm_index',
          },
          {
            title: 'Customer name',
            dataIndex: 'customer_name',
            key: 'customer_name',
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
            title: 'Name',
            dataIndex: 'name',
            key: 'name',
          }
        ]
      }
    },
    async asyncData({ params, $http }) {
    const res = await $http.get('/api/soft_alarms');
    const { list } = await res.json();
    console.log(list);
    return { list };
  },
}
</script>
