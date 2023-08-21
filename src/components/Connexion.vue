<template>
  <v-app>
    <v-main>
      <v-container>
        <v-card>
          <v-card-title>
            {{ isLogin ? 'Connexion' : 'Inscription' }}
          </v-card-title>
          <v-card-text>
            <v-form v-if="!isLogin">
              <v-text-field v-model="firstname" label="Prénom" required></v-text-field>
              <v-text-field v-model="lastname" label="Nom" required></v-text-field>
              <v-text-field v-model="email" label="Email" type='email' required></v-text-field>
              <v-text-field v-model="password" label="Mot de passe" type="password"></v-text-field>
              <v-btn @click="register" color="primary">S'inscrire</v-btn>
            </v-form>
            <v-form v-else>
              <v-text-field v-model="email" label="Email" type="email"></v-text-field>
              <v-text-field v-model="password" label="Mot de passe" type="password"></v-text-field>
              <v-btn @click="login" color="primary">Se connecter</v-btn>
            </v-form>
          </v-card-text>
          <v-card-actions>
            <v-btn @click="toggleLoginMode">
              {{ isLogin ? "Pas encore inscrit ?" : "Déjà inscrit ?" }}
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-container>
    </v-main>
  </v-app>
</template>


<script>
export default {
  data() {
    return {
      isLogin: true,
      firstname: "",
      lastname: "",
      email: "",
      password: ""
    };
  },
  methods: {
    toggleLoginMode() {
      this.isLogin = !this.isLogin;
    },
    async register() {
      try {
        const response = await fetch('http://localhost:5000/api/register',{
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            firstname: this.firstname,
            lastname: this.lastname,
            email: this.email,
            password: this.password
          }),
        });

        const responseData = await response.json();

        if (responseData.message != 'User registered successfully !') {
          alert("Utilisateur déjà enregistré, veuillez réessayer !");

        } else {
          // Réinitialiser les champs d'inscription après une inscription réussie
          this.firstname = "";
          this.lastname = "";
          this.email = "";
          this.password = "";

          alert("Inscription réussie ! Vous pouvez maintenant vous connecter.");
        }
      } catch (error) {
        console.error("Erreur lors de l'inscription :", error);
        alert("Une erreur est survenue lors de l'inscription. Veuillez réessayer.");
      }
    },
    
    async login() {
      try {
        const response = await fetch('http://localhost:5000/api/login', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            email: this.email,
            password: this.password,
          }),
        });

        const res = await response.json();
        if (res.response.ok) {
          // Réinitialiser les champs de connexion après une connexion réussie
          this.email = "";
          this.password = "";

          alert("Connexion réussie !");
        } else {
          // Gérer les cas où la réponse n'est pas OK (par exemple, afficher des messages d'erreur)
          console.error('Erreur lors de la connexion :', response.statusText);
          alert('Une erreur est survenue lors de la connexion. Veuillez réessayer.');
        }
      } catch (error) {
        console.error('Erreur lors de la connexion :', error);
        alert('Une erreur est survenue lors de la connexion. Veuillez réessayer.');
      }
    },
  },
}
</script>

