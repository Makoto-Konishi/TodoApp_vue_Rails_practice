<template>
  <div>
    <input type="text" v-model="newTask" placeholder="タスクを追加">
    <button v-on:click="createTask">追加</button>
    <ul>
      <li v-for="(task, index) in tasks" :key="task.id">
        <!-- チェックボックスが押されたらv-modelのis_doneを変更する -->
        <!-- updateでAPI側のデータも更新 -->
        <input type="checkbox" v-model="task.is_done" v-on:click="update(task.id)">
        <!-- タスクの表示。v-bind:classでis_doneを参照しているどうか判定 -->
        <span v-bind:class="{done: task.is_done}">{{ task.name }}</span>
        <!-- 削除ボタンを押すとdeleteTaskを実行 -->
        <button v-on:click="deleteTask(task.id, index)">削除</button>
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
      },
      // タスク更新。今回はis_doneのみ更新だが、タスク名とか色々更新するようカスタムしても良いと思う
      update: function(task_id){
        // apiへ更新リクエスト
        axios.put('/api/tasks/' + task_id)
        .then(response => {})
      },
      deleteTask: function(task_id, index){
        // apiへ削除リクエスト
        axios.delete('/api/tasks/' + task_id)
        .then(response => {
          this.tasks.splice(index, 1);
        })
      }
    }
  }

</script>
