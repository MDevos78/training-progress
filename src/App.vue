<script setup>
import { RouterLink, RouterView } from 'vue-router';


</script>

<template>
  <header>
    <h1>Progrès Sportif</h1>
    
    <nav>
      <RouterLink to="/">Welcome </RouterLink> 
      <RouterLink to="/Record">Record </RouterLink> 
      <RouterLink to="/Connexion">Connexion</RouterLink>
    </nav>
  </header>
  <RouterView />
  
</template>

<style scoped>
header {
  line-height: 1.5;
  height: 20vh;
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
  padding: 2rem;
  color: black;
  text-decoration: none;
}




</style>
