<template>
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

  <v-card v-if="isLoggedIn">
    <v-card-title>Bienvenue, {{ username }}</v-card-title>
    <v-btn color=#ff6400 text @click="toggleLogout()">Déconnexion</v-btn>
  </v-card>
</template>


<script>
import axios from 'axios';

export default {
  data() {
    return {
      username: "",
      password: "",
      name: "",
      firstname: "",
      email: "",
      isLoggedIn: false,
      showRegisterForm: false,
    }  
  },
  methods: {
    
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
      });

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
  mounted() {
    this.showRegisterForm = false
  },
};
</script>

