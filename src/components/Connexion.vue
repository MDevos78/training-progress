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
              <v-text-field v-model="loginEmail" label="Email" type="email"></v-text-field>
              <v-text-field v-model="loginPassword" label="Mot de passe" type="password"></v-text-field>
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
      password: "",
      loginEmail: "",
      loginPassword: "",
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

        if (response.ok) {
          // Réinitialiser les champs d'inscription après une inscription réussie
          this.firstname = "";
          this.lastname = "";
          this.email = "";
          this.password = "";

          alert("Inscription réussie ! Vous pouvez maintenant vous connecter.");
        } else {
          // Gérer les cas où la réponse n'est pas OK (par exemple, afficher des messages d'erreur)
          console.error('Erreur lors de l\'inscription :', responseData.message);
          alert('Une erreur est survenue lors de l\'inscription. Veuillez réessayer.');
        }
      } catch (error) {
        console.error('Erreur lors de l\'inscription :', error);
        alert('Une erreur est survenue lors de l\'inscription. Veuillez réessayer.');
      }
    },
    
    async login() {
      try {
        // Envoyer les données de connexion au serveur (simulé ici avec un délai)
        await new Promise(resolve => setTimeout(resolve, 1000)); // Simule une requête asynchrone

        // Après la connexion réussie, vous pouvez réinitialiser les champs ou effectuer d'autres actions
        this.loginEmail = "";
        this.loginPassword = "";

        // Afficher un message de succès ou rediriger vers une autre page si nécessaire
        alert("Connexion réussie !");
      } catch (error) {
        // En cas d'erreur, vous pouvez afficher un message d'erreur ou prendre d'autres mesures
        console.error("Erreur lors de la connexion :", error);
        alert("Une erreur est survenue lors de la connexion. Veuillez réessayer.");
      }
    },
  },
};
</script>

