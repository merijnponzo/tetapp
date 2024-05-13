<script setup>
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import IconRemove from '@/Components/IconRemove.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';

import { ref } from 'vue'

import { defineProps } from 'vue'

const subcardFormInput = ref('')

const props = defineProps({
    category_id: {
        type: [Boolean, Number, String],
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
        type: String,
    },
})



const data = ref({
    category_id: props.category_id,
    card_id: props.card_id,
    subcards: JSON.parse(props.subcards)
})

const notification = ref('')

const addCard = (e) => {
    if (subcardFormInput.value === '') {
        return
    }
    data.value.subcards.push(subcardFormInput.value)
    subcardFormInput.value = ''
};

const removeCard = (index) => {
    data.value.subcards.splice(index, 1)
};

const showNotification = () => {
    notification.value = 'Wijzigingen zijn opgeslagen'
    setTimeout(() => {
        notification.value = ''
    }, 2000)

};



</script>



<template>

    <Head title="Nieuwe Kaartje" />
    <AuthenticatedLayout>
        <div class="w-full flex justify-center py-8 flex-col items-center pb-64">
            <div class="w-full  max-w-[640px] bg-white p-4 rounded-xl shadow-xl flex gap-2 items-end">
                <div class="flex flex-col gap-2 w-2/3">
                    <Link :href="route('browse.cards', { category_id: data.category_id })"
                        class="text-blue-500 hover:underline">
                    <span class="text-2xl">Terug naar kaartje
                        {{ card.name }}</span>
                    </Link>
                    <TextInput id="name" type="name" class="mt-1 h-[48px] block w-full p-2 border-b-2 border-gray-500"
                        v-model="subcardFormInput" required autofocus placeholder="Type de naam van het subkaartje" />

                </div>
                <PrimaryButton class="w-1/3" @click="addCard" addCard>
                    Toevoegen
                </PrimaryButton>
            </div>
            <div class="my-16 flex flex-col gap-8 w-full text-center">
                <p v-if="!data.subcards.length">Nog geen subkaartjes toegevoegd</p>
                <p v-else><strong class="text-center w-full">Subkaartjes</strong></p>
                <div class="grid grid-cols-2 gap-8 container mx-auto">
                    <div class="bg-white rounded-xl p-16 w-full block text-center text-2xl relative"
                        v-for="(subcard, i) in data.subcards">
                        {{ subcard }}
                        <Button @click="removeCard(i), showNotification()"
                            class="bg-red-500 ring-red-500 text-white p-4 flex items-center justify-center rounded-xl absolute right-2 bottom-2 hover:opacity-70 text-2xl ">
                            <IconRemove class=" w-6 h-6" />
                        </Button>
                    </div>
                </div>
            </div>
            <Link @click="showNotification()" :class="{
                'bg-blue-500 pointer-events-none': notification !== '',
                'bg-green-500 hover:opacity-80': notification === ''
            }" class=" ring-green-500  text-white p-8 w-full rounded-xl text-2xl pb-8 container mx-auto" method="post"
                :href="route('browse.form.subcards-create')" as="button" :data="data" preserve-state preserve-scroll>
            <span v-if="notification !== ''">{{ notification }}</span>
            <span v-else>Wijzigingen opslaan</span>
            </Link>
        </div>
    </AuthenticatedLayout>

</template>
