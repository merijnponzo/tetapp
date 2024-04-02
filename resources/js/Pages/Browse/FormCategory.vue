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
    category: {
        type: Object,
    },
    mode: {
        type: String,
        default: 'create',
    }
})

const form = useForm({
    name: '',
    mode: props.mode,
});

const submit = () => {
    form.post(route('browse.form.category-create', { category_id: props.category_id, mode: props.mode }), {
        onFinish: () => form.reset(),
    });
};


</script>

<template>

    <Head title="Categorie" />
    <AuthenticatedLayout>
        <div class="w-full flex justify-center py-8 flex-col items-center">
            <form @submit.prevent="submit" class="w-full md:w-[400px] max-w-[640px] bg-white p-4 rounded-xl shadow-xl">
                <div class="flex flex-col gap-2">
                    <h4 class="text-2xl" v-if="category">{{ category.name }}</h4>
                    <InputLabel for="name" class="font-bold"
                        :value="mode === 'create' ? 'Voeg Categorie toe' : 'Bewerk de naam van deze categorie'" />
                    <p class="font-bold" v-if="category_id === 'false'">in hoofdcategorie</p>
                    <TextInput id="name" type="name"
                        class="mt-1 block w-full p-2 border-b-2 border-gray-500" v-model="form.name" required autofocus
                        :placeholder="mode === 'create' ? 'Naam van nieuwe categorie' : `type hier een andere naam voor  ${category.name}`" />

                    <InputError class="mt-2" :message="form.errors.name" />
                </div>

                <PrimaryButton class="block my-4 w-full" :class="{ 'opacity-25': form.processing }"
                    :disabled="form.processing">
                    <span v-if="mode === 'create'">
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

        </div>
    </AuthenticatedLayout>

</template>
