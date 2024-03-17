<script setup>
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';


const form = useForm({
    name: ''
});

const submit = () => {
    form.post(route('site.create'), {
        onFinish: () => form.reset(),
    });
};
</script>

<template>
    <div class="p-4 mx-auto">

        <Head title="Nieuwe app naam" />
        <AuthenticatedLayout>
            <form @submit.prevent="submit" class="w-full md:w-[480px] mx-auto my-4 ">
                <h4 class="text-2xl my-2">Maak een project aan</h4>
                <div>
                    <InputLabel for="name" value="Kies een naam" />
                    <TextInput id="name" type="name" class="mt-1 block w-full p-2" v-model="form.name" required
                        autofocus placeholder="Nieuwe app naam" />
                    <InputError class="mt-2" :message="form.errors.name" />
                </div>

                <PrimaryButton class="block my-4 w-full" :class="{ 'opacity-25': form.processing }"
                    :disabled="form.processing">
                    Nieuw project
                </PrimaryButton>

            </form>
        </AuthenticatedLayout>
    </div>
</template>
