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

const removeConfirm = ref(false)

const props = defineProps({
    category_id: {
        type: [Boolean, Number],
    },
    card_id: {
        type: [Number, String],
        default: 'create',
    },
    card: {
        type: Object,
    },
    category: {
        type: Object,
    },
})

const form = useForm({
    name: ''
});

const submit = () => {
    form.post(route('browse.form.card-create', { category_id: props.category_id, card_id: props.card_id }), {
        onFinish: () => form.reset(),
    });
};

const remove = () => {
    form.delete(route('browse.form.card-delete', { category_id: props.category_id, card_id: props.card_id }), {
        onFinish: () => form.reset(),
    });
};

</script>

<template>

    <Head title="Nieuwe Kaartje" />
    <AuthenticatedLayout>
        <div class="w-full flex justify-center py-8 flex-col items-center">
            <form @submit.prevent="submit" class="w-full md:w-[400px] max-w-[640px] bg-white p-4 rounded-xl shadow-xl">
                <div class="flex flex-col gap-2">
                    <h4 class="text-2xl" v-if="category">{{ category.name }}</h4>
                    <InputLabel for="name" class="font-bold"
                        :value="card_id === 'create' ? 'Voeg kaartje toe' : 'Bewerk de naam van dit kaartje'" />
                    <TextInput v-if="card !== null" id="name" type="name"
                        class="mt-1 block w-full p-2 border-b-2 border-gray-500" v-model="form.name" required autofocus
                        :placeholder="card_id === 'create' ? 'Naam van nieuw kaartje' : `type hier een andere naam voor  ${card.name}`" />
                    <TextInput v-else="card !== null && category_id" id="name" type="name"
                        class="mt-1 block w-full p-2 border-b-2 border-gray-500" v-model="form.name" required autofocus
                        :placeholder="card_id === 'create' ? 'Naam van nieuw kaartje' : `type hier een andere naam voor categorie  ${category.name}`" />
                    <InputError class="mt-2" :message="form.errors.name" />
                </div>

                <PrimaryButton class="block my-4 w-full" :class="{ 'opacity-25': form.processing }"
                    :disabled="form.processing">
                    <span v-if="card_id === 'create'">
                        Toevoegen
                    </span>
                    <span v-else>
                        Bewaar
                    </span>
                </PrimaryButton>
                <a href="#" onclick="history.back()" class="flex gap items-center">
                    <IconRight class="h-4 w-4 rotate-180" />
                    <span class="font-bold p-4 text-2xl hover:text-blue-500">Terug</span>
                </a>

            </form>
            <template v-if="card_id !== 'create'">
                <button @click="removeConfirm ? removeConfirm = false : removeConfirm = true" v-if="!removeConfirm"
                    class="bg-red-200 w-full md:w-[400px] rounded-xl my-4 p-4 hover:bg-red-500 hover:text-white">Verwijder
                    dit kaartje</button>
                <button @click="removeConfirm = false, remove()" v-if="removeConfirm"
                    class="bg-red-200 w-full md:w-[400px] rounded-xl my-4 p-4 hover:bg-red-500 hover:text-white">Verwijder
                    Definitief</button>
            </template>
        </div>
    </AuthenticatedLayout>

</template>
