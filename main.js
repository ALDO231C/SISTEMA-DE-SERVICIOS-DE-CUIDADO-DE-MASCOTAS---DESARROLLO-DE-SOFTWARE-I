// Validación de formulario de registro
document.getElementById('registerForm')?.addEventListener('submit', function(e) {
    e.preventDefault();
    
    const userType = document.getElementById('userType').value;
    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;
    
    if (!userType || !name || !email || !password) {
        alert('Por favor complete todos los campos');
        return;
    }
    
    // Aquí iría la lógica para enviar los datos al servidor
    console.log('Registrando usuario:', { userType, name, email });
    alert('Registro exitoso! Redirigiendo...');
    // window.location.href = 'profile.html';
});

// Filtros de búsqueda
document.getElementById('applyFilters')?.addEventListener('click', function() {
    const serviceType = document.getElementById('serviceType').value;
    const location = document.getElementById('location').value;
    
    console.log('Buscando con filtros:', { serviceType, location });
    // Aquí iría la lógica para filtrar los resultados
});

// Simulación de datos para el listado
const caretakers = [
    {
        name: "Carlos Mendoza",
        rating: 4.5,
        services: ["Paseos", "Alojamiento"],
        location: "Cusco Centro",
        image: "images/caretaker1.jpg"
    },
    // Más cuidadores...
];

function renderCaretakers() {
    const resultsContainer = document.querySelector('.results');
    if (!resultsContainer) return;
    
    resultsContainer.innerHTML = '';
    
    caretakers.forEach(caretaker => {
        const card = document.createElement('div');
        card.className = 'caretaker-card';
        card.innerHTML = `
            <img src="${caretaker.image}" alt="Cuidador">
            <div class="caretaker-info">
                <h3>${caretaker.name}</h3>
                <div class="rating">${'★'.repeat(Math.floor(caretaker.rating))}${'☆'.repeat(5 - Math.floor(caretaker.rating))} (${caretaker.rating})</div>
                <p class="services">${caretaker.services.join(', ')}</p>
                <p class="location">${caretaker.location}</p>
                <a href="#" class="btn">Ver Perfil</a>
            </div>
        `;
        resultsContainer.appendChild(card);
    });
}

// Ejecutar al cargar la página
document.addEventListener('DOMContentLoaded', function() {
    renderCaretakers();
});