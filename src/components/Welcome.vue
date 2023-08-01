<script>
import DatePicker from 'vue3-datepicker';
  export default {
    components: {
      DatePicker
    },
    data: () => ({
      items: ['Machine 1', 'Machine 2', 'Machine 3', 'Machine 4'],
      value: [''],
      selectedDate: null,
    }),
  }
  
</script>

<template>
  <v-select
    v-model="value"
    :items="items"
    label="Choisir une machine"
  ></v-select>
  
  <v-card class="mx-auto" max-width="700" height="500" variant="outlined">
    <v-card-item>
      <div class="text-h4 mb-1">
        Machine 1
      </div>
    </v-card-item>

    <div class="datePicker">
      <date-picker v-model="selectedDate"></date-picker>
    </div>
    

    <v-card-actions>
      <v-btn variant="outlined">
        Valider
      </v-btn>
    </v-card-actions>
  </v-card>
</template>



<style scoped>

</style>
