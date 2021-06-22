<template>
  <div>
    <input type="text" v-model="newTask" placeholder="タスクを追加">
    <button v-on:click="createTask">追加</button>
    <ul>
      <li v-for="task in tasks" :key="task.id">
        <p>タスク名：{{task.name}}</p>
      </li>
    </ul>
  </div>
</template>

<script>
  import axios from 'axios';
  export default{
    data: function(){
      return {
        tasks: [],
        newTask: ''
      }
    },
    // アプリが立ち上がったタイミングで最初に実行される関数を定義
    mounted() {
      this.setTask();
    },
    methods: {
      // APIからタスク一覧を取得
      setTask: function(){
        axios.get('/api/tasks')
        .then(response => {
          this.tasks = response.data.tasks;
        })
      },
      // 新しいタスクを作成
      createTask: function(){
        axios.post('/api/tasks', {
          task: {
            name: this.newTask
          }
        })
        .then( response => {
           // POST送信が成功したら、setTask()関数を呼び出し、投稿した情報を画面に表示
          this.setTask();
        })
      }
    }
  }

</script>
