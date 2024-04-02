<script setup>
// defineProps
import { defineProps } from 'vue'
import { Link } from '@inertiajs/vue3'
import IconVisible from '@/Components/IconVisible.vue'
import { router } from "@inertiajs/vue3";


// post to profile action
const toggleVisibility = function (category_id) {
    router.post("/browse/form-category/visibility", { category_id: category_id }, {
        preserveScroll: true,
        preserveState: true,
        // show notification
        onStart: () => {

        },
        onSuccess: (page) => {
            console.log(page)
        },
    });
}


const props = defineProps({
    card: {
        type: Object,
    },
    primary: {
        type: Object,
    },
    secondary: {
        type: Object,
    },
    edit: {
        type: Boolean,
    },
})
</script>

<template>
    <article
        class="h-[256px] bg-white rounded-xl p-4 relative text-4xl flex justify-center items-center hover:ring-blue-800 hover:ring-2 hover:text-blue-800">
        <p>{{ card.name }}</p>
        <template v-if="primary && !secondary && !edit">
            <Link :href="`/browse/cards/${card.id}`" class="absolute inset-1 z-0">
            </Link>
        </template>
        <template v-else-if="!primary && !secondary && !edit">
            <Link :href="`/browse/category/${card.id}`" class="absolute inset-1 z-0">
            </Link>
        </template>
        <div class="flex gap-2 absolute bottom-4 text-base items-center z-20" v-if="edit">
            <Link v-if="card.category_id"
                :href="route('browse.form.card', { card_id: card.id, category_id: card.category_id })"
                class=" bg-blue-200 rounded-full px-8 py-3  hover:bg-blue-700 hover:text-white">
            Bewerk
            kaartje</Link>
            <Link v-else :href="route('browse.form.category', { category_id: card.id, mode: 'edit' })"
                class=" bg-blue-200 rounded-full px-8 py-3  hover:bg-blue-700 hover:text-white">
            Bewerk
            Categorie </Link>
            <template v-if="!card.category_id">
                <button @click="toggleVisibility(card.id)" :class="card.visible ? 'bg-green-200' : 'bg-red-200'"
                    class="  rounded-full px-8 py-2  hover:bg-red-700 hover:text-white">
                    <IconVisible class="w-8 h-8" />
                </button>
            </template>
        </div>
    </article>
</template>
