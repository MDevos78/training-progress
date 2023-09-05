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
          <flat-pickr class="ml-4 mb-6 py-3" v-model="date" placeholder="Date" />
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
import flatPickr from 'vue-flatpickr-component'
import 'flatpickr/dist/flatpickr.css'
export default {
  data() {
    return {
      machines: [
        "ABDOMINAL",
        "SEATED DIP",
        "CHEST PRESS",
      ],
      weights: [
        "4.5 kg",
        "9 kg",
        "11 kg",
        "14 kg",
        "18 kg",
        "23 kg",
        "25 kg",
        "27 kg",
        "32 kg",
        "36 kg",
        "39 kg",
        "41 kg",
        "45 kg",
        "50 kg",
        "52 kg",
        "54 kg",
        "59 kg",
        "64 kg",
        "66 kg",
        "68 kg",
        "73 kg",
        "77 kg",
        "79 kg",
        "82 kg",
        "86 kg",
        "91 kg",
        "93 kg",
        "100 kg",
        "107 kg",
        "113 kg"
      ],
      selectedMachine: null,
      date: null,
      weight: null,
      note: "",
    };
  },
  components: {
    flatPickr,
  },
  methods: {
    submit() {
      console.log(this.selectedMachine, this.date, this.weight, this.note);
    },
  },
};
</script>

<style scoped>
  
</style> 
