<template>
  <div class="greetings">
      <h2 class="green">VOS PROGRES</h2>
      <br>
      <h3>
        Ajoutez vos activitées du jour
      </h3>
      <br>
  </div>
  <div>
    <v-select
      label="Machine"
      v-model="selectedMachine"
      :items="machines"
    ></v-select>
    <v-expand-transition>
      <v-card v-if="selectedMachine" class="mt-2">
        <v-card-title>{{ selectedMachine }}</v-card-title>
        <v-card-text>
          
          <v-select
            label="Poids"
            v-model="weight"
            :items="weights"
          ></v-select>
          <v-textarea
            label="Remarque"
            v-model="note"
          ></v-textarea>
        </v-card-text>
        <v-card-actions>
          <v-btn color="primary" @click="submit">Valider</v-btn>
        </v-card-actions>
      </v-card>
    </v-expand-transition>
  </div>
</template>

<script>
//import flatpickr from "vue-flatpickr";
export default {
  data() {
    return {
      machines: [
        "Machine 1",
        "Machine 2",
        "Machine 3",
      ],
      weights: [
        "1 kg",
        "2 kg",
        "3 kg",
      ],
      selectedMachine: null,
      
      weight: null,
      note: "",
    };
  },
  components: {
    
  },
  methods: {
    submit() {
      console.log(this.selectedMachine, this.weight, this.note);
    },
  },
};
</script>

<style scoped>

</style> 
