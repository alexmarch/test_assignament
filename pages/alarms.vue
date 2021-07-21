<template>
   <a-layout style="background: #fff; padding:20px 0">
      <a-space direction="vertical" align="center">
        <a-table bordered :columns="columns" :data-source="list">
        </a-table>
      </a-space>
   </a-layout>
</template>

<script>
export default {
  data() {
    return {
      columns: [
         {
          title: '#',
          dataIndex: 'alarm_index',
          key: 'alarm_index_alarm',
        },
        {
            title: 'Address',
            dataIndex: 'address',
            key: 'address',
        },
        {
            title: 'Alarm description',
            dataIndex: 'alarm_description',
            key: 'alarm_description',
        },
        {
            title: 'Alarm index',
            dataIndex: 'alarm_index',
            key: 'alarm_index',
        },
        {
            title: 'Client name',
            dataIndex: 'client_name',
            key: 'client_name',
        },
        {
            title: 'Client number',
            dataIndex: 'client_number',
            key: 'client_number',
        },
        {
            title: 'Mail',
            dataIndex: 'mail',
            key: 'mail',
        },
        {
            title: 'Mone',
            dataIndex: 'mone',
            key: 'mone',
        },
        {
            title: 'Phone',
            dataIndex: 'phone',
            key: 'phone',
        },
      ]
    }
  },
  async asyncData({ params, $http }) {
    const res = await $http.get('/api/alarms');
    const { list } = await res.json();
    console.log(list);
    return { list };
  },
}
</script>
