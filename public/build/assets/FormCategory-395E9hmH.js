import{r as u,T as g,o as s,f as r,a as o,u as t,w as m,F as p,Z as y,b as l,e as _,t as h,g as i,n as b}from"./app-vdSoiCWk.js";import{_ as x,a as w}from"./InputLabel-EHI2Yqo_.js";import{P as k}from"./PrimaryButton-DuWc2_Sr.js";import{_ as v}from"./TextInput-N3OO5R3a.js";import{_ as B}from"./AuthenticatedLayout-ggNQ0qPr.js";import{I as V}from"./IconRight-XJmusI3m.js";import"./_plugin-vue_export-helper-x3n3nnut.js";import"./ApplicationLogo-7YvT50cH.js";const C={class:"w-full flex justify-center py-8 flex-col items-center"},N={class:"flex flex-col gap-2"},$={key:0,class:"text-2xl"},F={key:1,class:"font-bold"},S={key:0},T={key:1},j={href:"#",onclick:"history.back()",class:"flex gap items-center"},z=l("span",{class:"font-bold p-4 text-2xl hover:text-blue-500"},"Terug",-1),Z={__name:"FormCategory",props:{category_id:{type:[Boolean,Number,String]},category:{type:Object},mode:{type:String,default:"create"}},setup(e){u(!1);const n=e,a=g({name:"",mode:n.mode}),d=()=>{a.post(route("browse.form.category-create",{category_id:n.category_id,mode:n.mode}),{onFinish:()=>a.reset()})};return(I,c)=>(s(),r(p,null,[o(t(y),{title:"Categorie"}),o(B,null,{default:m(()=>[l("div",C,[l("form",{onSubmit:_(d,["prevent"]),class:"w-full md:w-[400px] max-w-[640px] bg-white p-4 rounded-xl shadow-xl"},[l("div",N,[e.category?(s(),r("h4",$,h(e.category.name),1)):i("",!0),o(x,{for:"name",class:"font-bold",value:e.mode==="create"?"Voeg Categorie toe":"Bewerk de naam van deze categorie"},null,8,["value"]),e.category_id==="false"?(s(),r("p",F,"in hoofdcategorie")):i("",!0),o(v,{id:"name",type:"name",class:"mt-1 block w-full p-2 border-b-2 border-gray-500",modelValue:t(a).name,"onUpdate:modelValue":c[0]||(c[0]=f=>t(a).name=f),required:"",autofocus:"",placeholder:e.mode==="create"?"Naam van nieuwe categorie":`type hier een andere naam voor  ${e.category.name}`},null,8,["modelValue","placeholder"]),o(w,{class:"mt-2",message:t(a).errors.name},null,8,["message"])]),o(k,{class:b(["block my-4 w-full",{"opacity-25":t(a).processing}]),disabled:t(a).processing},{default:m(()=>[e.mode==="create"?(s(),r("span",S," Toevoegen ")):(s(),r("span",T," Bewaar "))]),_:1},8,["class","disabled"]),l("a",j,[o(V,{class:"h-4 w-4 rotate-180"}),z])],32)])]),_:1})],64))}};export{Z as default};
