<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head } from '@inertiajs/vue3';
import Card from '@/Components/Card.vue';
import { Link } from '@inertiajs/vue3';
// defineProps
import { defineProps, ref } from 'vue'
import IconRight from '@/Components/IconRight.vue';
import IconHome from '@/Components/IconHome.vue';
import IconEdit from '@/Components/IconEdit.vue';
import IconCheckmark from '@/Components/IconCheckmark.vue';
const editMode = ref(false)

const props = defineProps({
    primary: {
        type: Object,
    },
    secondary: {
        type: Object,
    },
    categories: {
        type: Array,
    },
    cards: {
        type: Array,
    },
})

const breadCrumbClass = "font-bold p-4 text-2xl hover:text-blue-500"
</script>

<template>

    <Head title="Dashboard" />

    <AuthenticatedLayout>
        <template #header>
            <nav class="flex justify-between">
                <div class="flex gap-4 items-center">
                    <Link :href="route('browse.index')"
                        :class="['bg-blue-500 p-4 rounded-md text-white hover:text-white', breadCrumbClass]">
                    <IconHome class="h-8 w-8 " />
                    </Link>
                    <template v-if="primary">

                        <Link :href="`/browse/category/${primary.id}`" :class="breadCrumbClass">{{ primary.name }}
                        </Link>
                        <IconRight class="h-8 w-8" />
                    </template>
                    <template v-if="secondary">
                        <Link :href="`/browse/cards/${secondary.id}`" :class="breadCrumbClass">{{ secondary.name
                        }}
                        </Link>
                    </template>
                </div>
                <div class="flex gap-2">
                    <button v-if="cards.length" @click="editMode = !editMode"
                        class="p-4 rounded-md text-white hover:ring-4"
                        :class="editMode ? 'bg-green-500 ring-green-500' : 'ring-blue-500 ring-2 text-blue-500'">
                        <IconEdit v-if="!editMode" class="h-8 w-8" />
                        <span v-if="editMode" class="flex gap-2 items-center">
                            <IconCheckmark class="h-8 w-8" />Klaar
                        </span>
                    </button>
                    <Link v-if="editMode"
                        :href="route('browse.form.create', { category_id: secondary.id, card_id: 'create' })"
                        class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 flex items-center justify-center rounded">Maak kaartje aan
                    </Link>
                </div>
            </nav>
        </template>

        <div class="grid grid-cols-2 gap-4 mt-2">
            <template v-if="categories.length">
                <Card v-for="categoryItem in categories" :key="categoryItem.id" :card="categoryItem" :primary="primary"
                    :secondary="secondary" :edit="editMode"></Card>
            </template>
            <template v-if="cards.length">
                <Card v-for="cardItem in cards" :key="cardItem.id" :card="cardItem" :primary="primary"
                    :secondary="secondary" :edit="editMode"></Card>
            </template>
        </div>
        <template v-if="!categories.length && !cards.length">
            <div class="py-[128px] flex flex-col justify-center items-center w-full gap-4">
                <h4 class="text-2xl">Geen kaartjes gevonden in <strong>{{ secondary.name }}</strong></h4>
                <Link v-if="secondary"
                    :href="route('browse.form.create', { category_id: secondary.id, card_id: 'create' })"
                    class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Maak kaartje aan
                </Link>
            </div>
        </template>

    </AuthenticatedLayout>
</template>
