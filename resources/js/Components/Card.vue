<script setup>
// defineProps
import { defineProps } from 'vue'
import { Link } from '@inertiajs/vue3'

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
        {{ card.name }}
        <template v-if="primary && !secondary && !edit">
            <Link :href="`/browse/cards/${card.id}`" class="absolute inset-1 z-0">
            </Link>
        </template>
        <template v-else-if="!primary && !secondary && !edit">
            <Link :href="`/browse/category/${card.id}`" class="absolute inset-1 z-0">
            </Link>
        </template>
        <template v-if="edit">
            <Link :href="route('browse.form', { card_id: card.id, category_id: card.category_id })"
                class="absolute bottom-4 bg-blue-200 rounded-full px-8 py-2 right-4 text-base hover:text-blue-700 z-20">
            Bewerk
            een kaartje</Link>
        </template>
    </article>
</template>
