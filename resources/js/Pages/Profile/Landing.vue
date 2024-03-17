<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import CreateSite from '@/Components/CreateSite.vue';
import { Head } from '@inertiajs/vue3';

</script>

<template>
    <Head title="Dashboard" ></Head>
    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Dashboard</h2>
        </template>
        <CreateSite v-if="!$page.props.auth.site"></CreateSite>
    </AuthenticatedLayout>
</template>
