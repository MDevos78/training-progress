<script setup>
import Welcome from './components/Welcome.vue'
import Record from './components/Record.vue'


</script>

<template>
  <header>
    <img alt="logo basifit" class="logo" src="src/assets/BFIT.AS_BIG.svg" width="500" height="200" />
    <div class="greetings">
      <h1 class="green">Vos Progrès</h1>
      <h3>
        Ajoutez vos activitées du jour
      </h3>
    </div>
  </header>

  <main>
    <Welcome />
  </main>
</template>

<style scoped>

</style>
