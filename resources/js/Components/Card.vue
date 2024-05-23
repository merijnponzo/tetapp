<script setup>
// defineProps
import { defineProps, ref, onMounted } from 'vue'
import { Link } from '@inertiajs/vue3'
import IconVisible from '@/Components/IconVisible.vue'
import IconRight from '@/Components/IconRight.vue'
import IconClose from '@/Components/IconClose.vue'
import PrimaryButton from '@/Components/PrimaryButton.vue'
import { router } from "@inertiajs/vue3";

const showSubcards = ref(false)
const showSubcardActive = ref(false)
const subcards = ref([])
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
        type: [Object, Boolean],
    },
    primary: {
        type: [Object, Boolean],
    },
    secondary: {
        type: [Object, Boolean],

    },
    edit: {
        type: Boolean,
    },
})

onMounted(() => {

    if (props.card.hasOwnProperty('subcards')) {
        if (props.card.subcards === 'null') {
        } else {
            subcards.value = JSON.parse(props.card.subcards)
        }
    }
})


const showSubcardToggle = function () {
    showSubcards.value = !showSubcards.value
}

</script>

<template>
    <article
        class="h-[256px] bg-white relative rounded-xl p-4 z-10 text-4xl flex justify-center items-center hover:ring-blue-800 hover:ring-2 hover:text-blue-800">
        <p>{{ card.name }}</p>
        <template v-if="primary && !secondary && !edit">
            <Link :href="`/browse/cards/${card.id}`" class="absolute inset-0 z-0">
            </Link>
        </template>
        <template v-else-if="!primary && !secondary && !edit">
            <Link :href="`/browse/category/${card.id}`" class="absolute inset-0 z-0">
            </Link>
        </template>
        <template v-else-if="subcards.length">
            <button class="absolute w-full h-full inset-0 z-10" @click="showSubcards = true"></button>
            <span class="w-full h-full bg-white absolute ring-2 ring-blue-200 left-0 top-0 rounded-xl -z-[5]"></span>
            <span class="w-full h-full ring-2 bg-white ring-blue-200 absolute left-2 top-2 rounded-xl -z-[6]"></span>
            <span class="w-full h-full ring-2 bg-white ring-blue-200 absolute left-4 top-4 rounded-xl -z-[7]"></span>
        </template>
        <div class="flex gap-2 absolute bottom-4 text-base items-center z-20" v-if="edit">
            <div v-if="card.category_id" class="flex gap-16">
                <Link :href="route('browse.form.card', { card_id: card.id, category_id: card.category_id })"
                    class=" bg-blue-200 rounded-full px-8 py-3  hover:bg-blue-700 hover:text-white">
                Bewerk
                kaartje</Link>
                <Link :href="route('browse.form.subcards', { card_id: card.id, category_id: card.category_id })"
                    class=" bg-purple-200 rounded-full px-8 py-3  hover:bg-blue-700 hover:text-white">

                Subkaartjes </Link>
            </div>
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
        <template v-if="showSubcards">
            <Teleport to="body">
                <div class="bg-black bg-opacity-15 fixed top-0 left-0 inset-0 flex justify-center items-center z-[50]"
                    @click="showSubcardToggle">
                    <div class="bg-white rounded-xl min-w-[80vw] h-[90vh] overflow-y-scroll shadow-md relative z-50"
                        @click.stop>
                        <PrimaryButton @click="showSubcards = false, showSubcardActive = ''"
                            class="fixed top-4 right-4">
                            <IconClose class="w-8 h-8" />
                        </PrimaryButton>
                        <template v-if="!showSubcardActive">
                            <div class="grid md:grid-cols-2 auto-rows-fr grid-rows-2 p-4 gap-4">
                                <div v-for="subcard in subcards" @click="showSubcardActive = subcard"
                                    class="bg-white rounded-xl flex items-center justify-centerw-full row-span-2 text-4xl ring-purple-30 ring-2 p-4 xl:p-8 text-center overflow-hidden">
                                    {{ subcard }}
                                </div>
                            </div>
                        </template>
                        <template v-else>
                            <div
                                class="flex flex-col gap-8 items-center justify-center w-full h-full text-3xl max-w-[90%] mx-auto">
                                <p class="opacity-60">{{ primary.name }}</p>
                                <IconRight class="w-8 h-8 rotate-90 opacity-70" />
                                <p class="opacity-60">{{ secondary.name }}</p>
                                <IconRight class="w-8 h-8  rotate-90" />
                                <p class="opacity-60">{{ card.name }}</p>
                                <IconRight class="w-8 h-8  rotate-90" />
                                <p>{{ showSubcardActive }}</p>
                            </div>
                        </template>
                    </div>


                </div>
            </Teleport>
        </template>

    </article>
</template>
<style>
.list-enter-active,
.list-leave-active {
    transition: all 0.5s ease;
}

.list-enter-from,
.list-leave-to {
    opacity: 0;
    transform: translateX(30px);
}
</style>