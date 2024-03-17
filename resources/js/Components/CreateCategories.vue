<script setup>
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';


const form = useForm({});

const submit = () => {
    form.post(route('categegories.create'), {});
};
</script>

<template>
    <div class="p-4 max-w-[320px] mx-auto">
        <Head title="Nieuwe app naam" />
        <form @submit.prevent="submit">
            <h4>Standaard categorieen aanmaken</h4>
            <PrimaryButton class="block my-4 w-full" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                Aanmaken
            </PrimaryButton>
        
        </form>
    </div>
</template>
