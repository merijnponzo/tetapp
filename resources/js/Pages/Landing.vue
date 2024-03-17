<script setup>
import { Head } from '@inertiajs/vue3';
import { defineProps } from 'vue'
import Card from '@/Components/Card.vue';
import GuestLayout from '@/Layouts/GuestLayout.vue';
import { Link } from '@inertiajs/vue3'

const props = defineProps({
    categories: {
        type: Array,
    },
})

</script>

<template>

    <Head title="Dashboard"></Head>

    <GuestLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Browse</h2>
        </template>
        <div class="grid grid-cols-2 gap-4 p-2">
            <Link :href="route('login')" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Login
            </Link>
            <Link :href="route('register')" class="text-blue-700 hover:bg-blue-200 font-bold py-2 px-4 rounded">Register
            </Link>
        </div>
    </GuestLayout>
</template>
