## Template latex skripsi stkipsurya final
Silahkan di sebarkan ke teman-teman yang lain

### Tambahan dari saya @Author{Kriz}

`Jika ingin mmenghilangkan lembaran kosong misalnya lembaran kosong di antara judul dan pengesahan
cukup hilangkan tanda % di depan onside pada file skripsi.tex`
 
`Di dalam file skripsi.tex tambahkan code di bawah [ \tableofcontents, \listoffigures, \listoftables ] seperti berikut:
***
\tableofcontents 
***
\addcontentsline{toc}{chapter}{Daftar Isi}
***
\listoffigures
***
\addcontentsline{toc}{chapter}{Daftar Gambar}
***
\listoftables
***
\addcontentsline{toc}{chapter}{Daftar Tabel}
***
`
Code di atas untuk memanggil nama daftar isi, daftar gambar, dan daftar table supaya muncul di dalam Daftar isi.

Jika da yang tidak ingin menginstall texlive, texmaker dll yang di gunakan untuk menulis code, saran sih.. bisa menggunkan media online di https://www.sharelatex.com/ dan saya sendiri menggunakan yang online, namun ini bisa di akses jika terhubung dengan internet. 



Terima kasih
