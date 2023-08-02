<script setup>
import { RouterLink, RouterView } from 'vue-router';


</script>

<template>
  <header>
    <h1>Progrès Sportif</h1>
    <div class="greetings">
      <h2 class="green">VOS PROGRES</h2>
      <br>
      <h3>
        Ajoutez vos activitées du jour
      </h3>
    </div>
    <nav>
      <RouterLink to="/">Welcome</RouterLink><br>
      <RouterLink to="/Record">Record</RouterLink>
      <RouterLink to="/Connexion">Connexion</RouterLink>
    </nav>
  </header>
  <RouterView />
  <main>
   
    
  </main>
</template>

<style scoped>

</style>
