import{_ as $}from"./AuthenticatedLayout-GixkrSRA.js";import{o as t,f as n,b as a,t as m,c as g,u as c,j as o,g as s,w as i,d as l,n as b,a as h,O as C,r as j,F as f,Z as L,k as w}from"./app-BMj-OeBM.js";import{_ as x}from"./_plugin-vue_export-helper-x3n3nnut.js";import{I as V}from"./IconRight-8cuB_hMU.js";import"./ApplicationLogo-c0KNTNGM.js";const z={},B={fill:"currentColor",height:"800px",width:"800px",version:"1.1",xmlns:"http://www.w3.org/2000/svg",viewBox:"0 0 512 512","xmlns:xlink":"http://www.w3.org/1999/xlink","enable-background":"new 0 0 512 512"},M=a("g",null,[a("path",{d:"m494.8,241.4l-50.6-49.4c-50.1-48.9-116.9-75.8-188.2-75.8s-138.1,26.9-188.2,75.8l-50.6,49.4c-11.3,12.3-4.3,25.4 0,29.2l50.6,49.4c50.1,48.9 116.9,75.8 188.2,75.8s138.1-26.9 188.2-75.8l50.6-49.4c4-3.8 11.7-16.4 0-29.2zm-238.8,84.4c-38.5,0-69.8-31.3-69.8-69.8 0-38.5 31.3-69.8 69.8-69.8 38.5,0 69.8,31.3 69.8,69.8 0,38.5-31.3,69.8-69.8,69.8zm-195.3-69.8l35.7-34.8c27-26.4 59.8-45.2 95.7-55.4-28.2,20.1-46.6,53-46.6,90.1 0,37.1 18.4,70.1 46.6,90.1-35.9-10.2-68.7-29-95.7-55.3l-35.7-34.7zm355,34.8c-27,26.3-59.8,45.1-95.7,55.3 28.2-20.1 46.6-53 46.6-90.1 0-37.2-18.4-70.1-46.6-90.1 35.9,10.2 68.7,29 95.7,55.4l35.6,34.8-35.6,34.7z"})],-1),O=[M];function S(e,r){return t(),n("svg",B,O)}const A=x(z,[["render",S]]),N={class:"h-[256px] bg-white rounded-xl p-4 relative text-4xl flex justify-center items-center hover:ring-blue-800 hover:ring-2 hover:text-blue-800"},Z={key:2,class:"flex gap-2 absolute bottom-4 text-base items-center z-20"},k={__name:"Card",props:{card:{type:Object},primary:{type:Object},secondary:{type:Object},edit:{type:Boolean}},setup(e){const r=function(d){C.post("/browse/form-category/visibility",{category_id:d},{preserveScroll:!0,preserveState:!0,onStart:()=>{},onSuccess:y=>{console.log(y)}})};return(d,y)=>(t(),n("article",N,[a("p",null,m(e.card.name),1),e.primary&&!e.secondary&&!e.edit?(t(),g(c(o),{key:0,href:`/browse/cards/${e.card.id}`,class:"absolute inset-1 z-0"},null,8,["href"])):!e.primary&&!e.secondary&&!e.edit?(t(),g(c(o),{key:1,href:`/browse/category/${e.card.id}`,class:"absolute inset-1 z-0"},null,8,["href"])):s("",!0),e.edit?(t(),n("div",Z,[e.card.category_id?(t(),g(c(o),{key:0,href:d.route("browse.form.card",{card_id:e.card.id,category_id:e.card.category_id}),class:"bg-blue-200 rounded-full px-8 py-3 hover:bg-blue-700 hover:text-white"},{default:i(()=>[l(" Bewerk kaartje")]),_:1},8,["href"])):(t(),g(c(o),{key:1,href:d.route("browse.form.category",{category_id:e.card.id,mode:"edit"}),class:"bg-blue-200 rounded-full px-8 py-3 hover:bg-blue-700 hover:text-white"},{default:i(()=>[l(" Bewerk Categorie ")]),_:1},8,["href"])),e.card.category_id?s("",!0):(t(),n("button",{key:2,onClick:y[0]||(y[0]=u=>r(e.card.id)),class:b([e.card.visible?"bg-green-200":"bg-red-200","rounded-full px-8 py-2 hover:bg-red-700 hover:text-white"])},[h(A,{class:"w-8 h-8"})],2))])):s("",!0)]))}},_={},D={class:"svg-icon",fill:"currentColor",viewBox:"0 0 1024 1024",version:"1.1",xmlns:"http://www.w3.org/2000/svg"},E=a("path",{d:"M418.144 639.168h166.976a94.016 94.016 0 0 1 93.92 93.952v156.544c0 17.248 14.08 31.296 31.328 31.296h166.976a31.36 31.36 0 0 0 31.296-31.296V480.128a31.264 31.264 0 0 0-10.912-23.776L522.016 134.336a31.104 31.104 0 0 0-40.768 0L105.568 456.32a31.2 31.2 0 0 0-10.944 23.776v409.536a31.36 31.36 0 0 0 31.296 31.296h167.008a31.36 31.36 0 0 0 31.296-31.296V733.12a94.048 94.048 0 0 1 93.92-93.952z m459.2 344.416h-166.976a94.016 94.016 0 0 1-93.92-93.92V733.12a31.36 31.36 0 0 0-31.328-31.36h-166.976a31.36 31.36 0 0 0-31.296 31.36v156.544a94.048 94.048 0 0 1-93.92 93.92H125.92A94.048 94.048 0 0 1 32 889.664V480.128c0-27.456 11.968-53.472 32.8-71.36L440.512 86.816a93.44 93.44 0 0 1 122.272 0l375.712 322.016a93.888 93.888 0 0 1 32.768 71.328v409.536a94.016 94.016 0 0 1-93.92 93.92z"},null,-1),F=[E];function G(e,r){return t(),n("svg",D,F)}const H=x(_,[["render",G]]),I={},K={viewBox:"0 0 24 24",xmlns:"http://www.w3.org/2000/svg"},R=a("rect",{id:"view-box",width:"24",height:"24",fill:"none"},null,-1),T=a("path",{id:"Shape",d:"M.75,17.5A.751.751,0,0,1,0,16.75V12.569a.755.755,0,0,1,.22-.53L11.461.8a2.72,2.72,0,0,1,3.848,0L16.7,2.191a2.72,2.72,0,0,1,0,3.848L5.462,17.28a.747.747,0,0,1-.531.22ZM1.5,12.879V16h3.12l7.91-7.91L9.41,4.97ZM13.591,7.03l2.051-2.051a1.223,1.223,0,0,0,0-1.727L14.249,1.858a1.222,1.222,0,0,0-1.727,0L10.47,3.91Z",transform:"translate(3.25 3.25)",fill:"currentColor"},null,-1),q=[R,T];function J(e,r){return t(),n("svg",K,q)}const P=x(I,[["render",J]]),Q={},U={height:"800px",width:"800px",version:"1.1",id:"Capa_1",xmlns:"http://www.w3.org/2000/svg","xmlns:xlink":"http://www.w3.org/1999/xlink",viewBox:"0 0 17.837 17.837","xml:space":"preserve"},W=a("g",null,[a("path",{fill:"currentColor",d:`M16.145,2.571c-0.272-0.273-0.718-0.273-0.99,0L6.92,10.804l-4.241-4.27
		c-0.272-0.274-0.715-0.274-0.989,0L0.204,8.019c-0.272,0.271-0.272,0.717,0,0.99l6.217,6.258c0.272,0.271,0.715,0.271,0.99,0
		L17.63,5.047c0.276-0.273,0.276-0.72,0-0.994L16.145,2.571z`})],-1),X=[W];function Y(e,r){return t(),n("svg",U,X)}const p=x(Q,[["render",Y]]),ee={class:"flex justify-between"},te={class:"flex gap-4 items-center"},re={class:"flex gap-2"},ae={key:1,class:"flex gap-2 items-center"},ne={class:"grid grid-cols-2 gap-4 mt-2"},se={key:0,class:"py-[128px] flex flex-col justify-center items-center w-full gap-4"},ce={class:"text-2xl"},ie={class:"text-2xl"},v="font-bold p-4 text-2xl hover:text-blue-500",ge={__name:"Index",props:{primary:{type:Object},secondary:{type:Object},categories:{type:Array},cards:{type:Array}},setup(e){const r=j(!1);return(d,y)=>(t(),n(f,null,[h(c(L),{title:"Dashboard"}),h($,null,{header:i(()=>[a("nav",ee,[a("div",te,[h(c(o),{href:d.route("browse.index"),class:b(["bg-blue-500 p-4 rounded-md text-white hover:text-white",v])},{default:i(()=>[h(H,{class:"h-8 w-8"})]),_:1},8,["href","class"]),e.primary?(t(),n(f,{key:0},[h(c(o),{href:`/browse/category/${e.primary.id}`,class:b(v)},{default:i(()=>[l(m(e.primary.name),1)]),_:1},8,["href"]),h(V,{class:"h-8 w-8"})],64)):s("",!0),e.secondary?(t(),g(c(o),{key:1,href:`/browse/cards/${e.secondary.id}`,class:b(v)},{default:i(()=>[l(m(e.secondary.name),1)]),_:1},8,["href"])):s("",!0)]),a("div",re,[a("button",{onClick:y[0]||(y[0]=u=>r.value=!r.value),class:b(["p-4 rounded-md text-blue-500 hover:ring-4",r.value?"bg-green-500 ring-green-500 text-white":"ring-blue-500 ring-2 text-blue-500"])},[r.value?s("",!0):(t(),g(P,{key:0,class:"h-8 w-8"})),r.value?(t(),n("span",ae,[h(p,{class:"h-8 w-8"}),l("Klaar ")])):s("",!0)],2),r.value&&e.cards.length&&e.secondary.id?(t(),g(c(o),{key:0,href:d.route("browse.form.card",{category_id:e.secondary.id,card_id:"create"}),class:"bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 flex items-center justify-center rounded"},{default:i(()=>[l(" Maak kaartje aan ")]),_:1},8,["href"])):r.value&&e.categories.length<9&&e.categories.length?(t(),g(c(o),{key:1,href:d.route("browse.form.category",{category_id:e.primary.id?e.primary.id:"false",mode:"create"}),class:"bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 flex items-center justify-center rounded"},{default:i(()=>[l(" Maak Categorie aan ")]),_:1},8,["href"])):s("",!0)])])]),default:i(()=>[a("div",ne,[e.categories.length?(t(!0),n(f,{key:0},w(e.categories,u=>(t(),g(k,{class:b({"bg-opacity-20 text-gray-600 ring-slate-200 ring-2":r.value&&u.visibility!=="1","opacity-100":r.value&&u.visibility==="1",hidden:u.visibility!=="1"&&!r.value}),key:u.id,card:u,primary:e.primary,secondary:e.secondary,edit:r.value},null,8,["class","card","primary","secondary","edit"]))),128)):s("",!0),e.cards.length?(t(!0),n(f,{key:1},w(e.cards,u=>(t(),g(k,{key:u.id,card:u,primary:e.primary,secondary:e.secondary,edit:r.value},null,8,["card","primary","secondary","edit"]))),128)):s("",!0)]),!e.categories.length||!e.cards.length?(t(),n("div",se,[!e.cards.length&&e.secondary.id?(t(),n(f,{key:0},[a("h4",ce,[l("Geen kaartjes gevonden in "),a("strong",null,m(e.secondary.name||e.primary.name),1)]),h(c(o),{href:d.route("browse.form.card-create",{category_id:e.secondary.id,card_id:"create"}),class:"bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"},{default:i(()=>[l("Maak kaartje aan ")]),_:1},8,["href"])],64)):!e.categories.length&&!e.secondary.id?(t(),n(f,{key:1},[a("h4",ie,[l("Geen Categorien gevonden in "),a("strong",null,m(e.secondary.name||e.primary.name),1)]),h(c(o),{href:d.route("browse.form.category",{category_id:e.primary.id?e.primary.id:"false",mode:"create"}),class:"bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"},{default:i(()=>[l("Maak Categorie aan ")]),_:1},8,["href"])],64)):s("",!0)])):s("",!0)]),_:1})],64))}};export{ge as default};