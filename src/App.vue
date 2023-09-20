
<template>
  <header>
    <h1>TRAINING PROGRESS</h1>
    
    <v-form v-if="!isLoggedIn && !showRegisterForm" v-on:submit.prevent="submitConnexion">
    <v-text-field
      v-model="username"
      label="Nom d'utilisateur"
      required
    ></v-text-field>
    <v-text-field
      v-model="password"
      label="Mot de passe"
      required
      type="password"
    ></v-text-field>
    <v-btn color=#ff6400 type="submit">Connexion</v-btn>
    <br>
    <br>
    <v-btn text @click="toggleShowRegisterForm()">Pas encore inscrit ?</v-btn>
  </v-form>

  <v-form v-if="!isLoggedIn && showRegisterForm" v-on:submit.prevent="submitRegister">
    <v-text-field
      v-model="username"
      label="Nom d'utilisateur"
      required
    ></v-text-field>
    <v-text-field
      v-model="password"
      label="Mot de passe"
      required
      type="password"
    ></v-text-field>
    <v-text-field
      v-model="name"
      label="Nom"
      required
    ></v-text-field>
    <v-text-field
      v-model="firstname"
      label="Prénom"
      required
    ></v-text-field>
    <v-text-field
      v-model="email"
      label="Email"
      required
    ></v-text-field>
    <v-btn color=#ff6400 type="submit">Inscription</v-btn>
    <br>
    <br>
    <v-btn text @click="!toggleShowRegisterForm()">Déjà inscrit ?</v-btn>
  </v-form>
  <br>
  <br>
  
  <v-card v-if="isLoggedIn">
    <v-card-title>Bienvenue, {{ username }}</v-card-title>
    <v-btn color=#ff6400 text @click="toggleLogout()">Déconnexion</v-btn>
  </v-card>

  <div class="mt-4" >
    <h3>Ajoutez vos activitées du jour</h3>
    <br>
  </div>
  <div>
    <v-select
      label="Machine"
      v-model="selectedMachine"
      :items="machines"
    ></v-select>
    <v-expand-transition>
      <v-card id='expand' v-if="selectedMachine" class="mt-2">
        <v-card-title>{{ selectedMachine }}</v-card-title>
        <v-card-text>
          <flat-pickr class="ml-4 mb-6 py-3" v-model="exercice_date" placeholder="Date" />
          <v-select
            label="Poids"
            v-model="weight"
            :items="weights"
          ></v-select>
          <v-textarea
            label="Remarque"
            v-model="remark"
          ></v-textarea>
        </v-card-text>
        <v-card-actions>
          <v-btn color="primary" @click="sendData()">Valider</v-btn>
        </v-card-actions>
      </v-card>
    </v-expand-transition>
  </div>  
  <div class="table">
    <button @click="displayLastWorkouts" class="mt-6">Afficher l'historique d'exercices</button>
    <table v-if="workouts.length > 0" class="mt-2">
      <thead>
        <tr>
          <th>Date</th>
          <th>Machine</th>
          <th>Poids</th>
          <th>Remarque</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="workout in workouts" :key="workout.id">
          <td>{{ workout.exercice_date }}</td>
          <td>{{ workout.selectedMachine }}</td>
          <td>{{ workout.weight }}</td>
          <td>{{ workout.remark }}</td>
        </tr>
      </tbody>
    </table>
    <div v-else>
      <p>Aucune donnée d'exercice disponible.</p>
    </div>
  </div>
  </header>
  
  
</template>

<script>
import { RouterLink, RouterView } from 'vue-router';
import axios from 'axios'
import flatPickr from 'vue-flatpickr-component'
import 'flatpickr/dist/flatpickr.css'

export default {
  data() {
    return {
      workouts: [],
      username: "",
      password: "",
      name: "",
      firstname: "",
      email: "",
      isLoggedIn: false,
      showRegisterForm: false,
      machines: [
        "ABDOMINAL",
        "SEATED DIP",
        "CHEST PRESS",
        "ROTARY TORSO",
        "ARM CURL",
        "CALF PRESS",
        "SEATED ROW",
        "LAT PULL",
        "HIP ADDUCTION",
        "LEG EXTENSION",
        "SHOULDER PRESS",
        "ABDOMINAL CRUNCH",
        "LEG PRESS"
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
        "113 kg",
        "120 kg",
        "127 kg",
        "134 kg",
        "141 kg",
        "147 kg",
        "154 kg",
        "161 kg",
        "168 kg",
        "175 kg",
      ],
      selectedMachine: null,
      exercice_date: null,
      weight: null,
      remark: "",
    }  
  },
  components: {
    flatPickr,
  },
  methods: {
    async displayLastWorkouts() {
     
        // Remplacez l'URL par celle de votre API Flask
        const res = await axios.get('http://localhost:5000/api/v1/workouts/' + this.username,{responseType: 'json'})
            
        if (res.status === 200) {
          this.workouts = res.data.workouts
          for (const workout of this.workouts) {
            // Formatez la date
            const date = new Date(workout.exercice_date);
            workout.exercice_date = date.toLocaleDateString();
          }
        } else {
          alert(res.status)
        }
    },      
    async sendData() {  
      
      const config = await axios.post("http://localhost:5000/api/v1/workouts",{
          
          selectedMachine : this.selectedMachine,
          exercice_date : this.exercice_date,
          weight : this.weight,
          remark : this.remark,
          username : this.username,
      })

          if (config.status === 200) {
            console.log (config.data.message)
            if (config.data.message = 'Workout enregistré') {
              alert("Exercice enregistré")
              this.selectedMachine = null
            } else {
              alert("erreur d'enregistrement")
            }
          } else {
            console.log (config.status)
            alert("erreur d'envoi")
          }
        },
    async submitRegister() {
      // Code d'inscription
      const res = await axios.post("http://localhost:5000/api/register", {
        username: this.username,
        password: this.password,
        name: this.name,
        firstname: this.firstname,
        email: this.email,
      });

      console.log (res.data.message)
      if (res.data.message != 'User registered successfully !') {
        alert("utilisateur déjà enregistré")
      } else {
        alert("Inscription réussie !")
        this.isLoggedIn = true
      }
    },
    async submitConnexion() {
      // Code de connexion
      const res = await axios.post("http://localhost:5000/api/login", {
        username: this.username,
        password: this.password,
      })

      console.log (res.data.message)
      if (res.data.message == 'true') {
        alert("Connexion réussie")
        this.isLoggedIn = true
      } else {
        alert("Le nom d'utilistateur ou le mot de passe est incorrecte")
      }
    },
    toggleShowRegisterForm() {
      this.showRegisterForm = !this.showRegisterForm;
    },
    toggleLogout() {
      this.isLoggedIn = !this.isLoggedIn;
    },
    
  },
  
};
</script>

<style scoped>
header {
  line-height: 1.5;
  height: 100%;
  width: 600px;
}
h1{
  color: #ff6400;
  text-align: center;
  height: 70px;
}
nav {
  width: 100%;
  font-size: 20px;
  text-align: center;
  
}
nav a.router-link-exact-active {
  color: #ff6400;
  
}
nav a.router-link-exact-active:hover {
  background-color: transparent;
}
nav a {
  display: inline-block;
  padding: 0 2rem 2rem 2rem;
  color: black;
  text-decoration: none;
}
#expand {
  background-color: #8ca5b6;
}
.table{
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}
table {
  background-color: #629194;
  width: 550px;
}
</style>
