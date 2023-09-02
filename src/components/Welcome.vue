<template>
  <div class="greetings">
      <h2 class="green">VOS PROGRES</h2>
      <br>
      <h3>
        Ajoutez vos activitées du jour
      </h3>
      <br>
  </div>
  <v-select
    v-model="machine"
    :items="machines"
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

    <v-select
    class="mx-4"
      v-model="maxWeight"
      :items="weight"
      label="Poid Max"
    ></v-select>
    
    <v-container fluid>
      <v-textarea
      label="Remarque"
      ></v-textarea>
    </v-container>

    <v-card-actions class="ml-2">
      <v-btn variant="outlined">
        Valider
      </v-btn>
    </v-card-actions>
  </v-card>
</template>


<script>
import DatePicker from 'vue3-datepicker';
  export default {
    components: {
      DatePicker
    },
    data: () => ({
      machines: ['Machine 1', 'Machine 2', 'Machine 3', 'Machine 4'],
      machine: [''],
      selectedDate: null,
      weight: ['18', '23', '35', '52'],
      maxWeight: [],
    }),
  }
  
</script>

<style scoped>

</style>
