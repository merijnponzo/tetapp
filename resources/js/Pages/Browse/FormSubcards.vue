<script setup>
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import IconRight from '@/Components/IconRight.vue';
import { ref } from 'vue'

import { defineProps } from 'vue'

const subcardFormInput = ref('')

const props = defineProps({
    category_id: {
        type: [Boolean, Number],
    },
    card_id: {
        type: [Number, String],
    },
    card: {
        type: Object,
    },
    category: {
        type: Object,
    },
    subcards: {
        type: Array,
    },
})

const form = useForm({
    subcards: props.subcards.length ? props.subcards : [],
});

const submit = () => {
    form.post(route('browse.form.subcards-create', { category_id: props.category_id, card_id: props.card_id }), {
        
    });
};


const changeSubcards = (e) => {
    form.subcards.push(subcardFormInput.value);
 };

</script>

<template>

    <Head title="Nieuwe Kaartje" />
    <AuthenticatedLayout>
        <div class="w-full flex justify-center py-8 flex-col items-center">
            <form @submit.prevent="submit" class="w-full md:w-[400px] max-w-[640px] bg-white p-4 rounded-xl shadow-xl">
                <div class="flex flex-col gap-2">
                    <h4 class="text-2xl" v-if="category">Subkaartjes {{ card.name }}</h4>
                    <TextInput id="name" type="name" class="mt-1 block w-full p-2 border-b-2 border-gray-500"
                        v-model="subcardFormInput" required autofocus placeholder="Type de naam van het subkaartje" />
                
                </div>
                <PrimaryButton @click="changeSubcards()" class="block my-4 w-full"
                    :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                    Toevoegen
                </PrimaryButton>
            </form>
            <div class="my-16 flex flex-col gap-8">
                <p v-if="!form.subcards.length">Nog geen subkaartjes toegevoegd</p>
                <p v-else><strong>Subkaartjes</strong></p>
                <div v-for="(subcard, i) in form.subcards">
                    {{ subcard.name }}
                </div>
            </div>

        </div>
    </AuthenticatedLayout>

</template>
